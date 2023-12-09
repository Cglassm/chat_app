import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = context.select((ChatBloc bloc) => bloc.state.messages);
    final l10n = context.l10n;
    final status = context.select((ChatBloc bloc) => bloc.state.status);

    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state.status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            CHSnackBar.error(
              text: l10n.errorLoadingMessages,
            ),
          );
        }
        if (state.status.isMessageDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            CHSnackBar.success(
              text: l10n.messageDeleted,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: CHAppBar.backButton(
          textTitle: l10n.chatAppTitle,
          onTapBackButton: () {
            Navigator.of(context).pop();
          },
          actions: [
            CHUnderlinedButton(
              onPressed: () {
                // TODO(carol): add support mail
              },
              text: l10n.supportButtonText,
            ),
          ],
        ),
        body: status.isLoadingMessages
            ? const Center(child: CHCircularProgressIndicator())
            : _ChatBody(
                messages: messages,
              ),
      ),
    );
  }
}

class _ChatBody extends StatefulWidget {
  const _ChatBody({required this.messages});
  final List<ChatMessage> messages;

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<_ChatBody> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollToBottom();
  }

  @override
  void didUpdateWidget(_ChatBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length > oldWidget.messages.length) {
      scrollToBottom();
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.messages.isNotEmpty)
          Expanded(
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: ListView.builder(
                controller: scrollController,
                itemCount: widget.messages.length,
                itemBuilder: (context, index) {
                  final chatMessage = widget.messages[index];
                  return Align(
                    alignment: chatMessage.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: ChatBubble(chatMessage: chatMessage),
                  );
                },
              ),
            ),
          )
        else
          const EmptyChatBody(),
        ChatInputBar(),
      ],
    );
  }
}
