package chat

import kotlinx.coroutines.experimental.channels.consumeEach
import org.jetbrains.ktor.application.Application
import org.jetbrains.ktor.application.ApplicationCallPipeline
import org.jetbrains.ktor.application.install
import org.jetbrains.ktor.features.CallLogging
import org.jetbrains.ktor.features.DefaultHeaders
import org.jetbrains.ktor.http.ContentType
import org.jetbrains.ktor.response.respond
import org.jetbrains.ktor.response.respondText
import org.jetbrains.ktor.routing.Routing
import org.jetbrains.ktor.routing.get
import org.jetbrains.ktor.sessions.*
import org.jetbrains.ktor.util.nextNonce
import org.jetbrains.ktor.websocket.*
import java.time.Duration

private val server = ChatServer()

fun Application.main() {
    install(DefaultHeaders)
    install(CallLogging)
    install(WebSockets) {
        Duration.ofMinutes(1)
    }

    install(Routing) {
        install(Sessions) {
            cookie<ChatSession>("SESSION")
        }

        intercept(ApplicationCallPipeline.Infrastructure) {
            if (call.sessions.get<ChatSession>() == null) {
                call.sessions.set(ChatSession(nextNonce()))
            }
        }

        webSocket("/ws") {
            val session = call.sessions.get<ChatSession>();
            if (session == null) {
                close(CloseReason(CloseReason.Codes.VIOLATED_POLICY, "No session"))
                return@webSocket
            }

            server.memberJoin(session.id, this)

            try {
                incoming.consumeEach { frame ->
                    if (frame is Frame.Text) {
                        receivedMessage(session.id, frame.readText())
                    }
                }
            } finally {
                server.memberLeft(session.id, this)
            }

            //outgoing.send(Frame.Text("Hello you fugin' socket!"))
        }

        get("/") {
            call.respondText("Hello World!", ContentType.Text.Html)
        }
    }
}

data class ChatSession(val id: String)

private suspend fun receivedMessage(id: String, command: String) {
    val cmdChar = "\\"
    when {
        command.startsWith(cmdChar + "who") -> server.who(id)
        command.startsWith(cmdChar + "user") -> {
            val newName = command.removePrefix(cmdChar + "user").trim()
            when {
                newName.isEmpty() -> server.sendTo(id, "server::help", cmdChar + "user [newName]")
                newName.length > 50 -> server.sendTo(id, "server::help", "new name is too long: 50 characters limit")
                else -> server.memberRenamed(id, newName)
            }
        }
        command.startsWith(cmdChar + "help") -> server.help(id)
        command.startsWith(cmdChar) -> server.sendTo(id, "server::help", "Unknown command ${command.takeWhile { !it.isWhitespace() }}")
        else -> server.message(id, command)
    }
}