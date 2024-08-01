import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:with_u/env/env.dart';

import '../dto/message_dto/data_dto.dart';

//추후 threadId 받을 수 있게 수정

class Api {
  // String globalThreadId = '';
  String globalThreadId = 'thread_SSVjYXxBNVv7IHrFTnObMTYa';

  //thread id return
  Future<String> makeThread() async {
    final url = Uri.parse('https://api.openai.com/v1/threads');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'OpenAI-Beta': 'assistants=v2',
    };

    final response = await http.post(url, headers: headers, body: '');
    if (response.statusCode == 200) {
      print('Thread created successfully:');
      return jsonDecode(response.body)['id'];
    } else {
      print('Failed to create thread. Status code: ${response.statusCode}');
      throw Exception('error');
    }
  }

  // Future<void> addMessageToTheThread(String message, String threadId) async {
  //   final url =
  //       Uri.parse('https://api.openai.com/v1/threads/$threadId/messages');
  Future<void> addMessageToTheThread(String message) async {
    final url =
        Uri.parse('https://api.openai.com/v1/threads/$globalThreadId/messages');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'OpenAI-Beta': 'assistants=v2',
    };
    final body = jsonEncode({'role': 'user', 'content': message});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Message sent successfully:');
        print(response.body);
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
        throw Exception('error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<void> createRun(String threadId) async {
  //   final url = Uri.parse('https://api.openai.com/v1/threads/$threadId/runs');
  Future<void> createRun() async {
    final url =
        Uri.parse('https://api.openai.com/v1/threads/$globalThreadId/runs');
    final headers = {
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'Content-Type': 'application/json',
      'OpenAI-Beta': 'assistants=v2',
    };
    final body = jsonEncode({
      'assistant_id': 'asst_JOEEKN5NfmSNQXOnaRrRe6wC',
      'instructions': '',
      'stream': true,
      'tool_choice': {'type': 'file_search'}
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Run created successfully:');
        print(response.body);
      } else {
        print('Failed to create run. Status code: ${response.statusCode}');
        throw Exception('error');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception(e);
    }
  }

  // Future<String> getMessage(String threadId) async {
  //   final url =
  //       Uri.parse('https://api.openai.com/v1/threads/$threadId/messages');
  // Future<List<TextDto>> getTextDto() async {
  //   final url = Uri.parse(
  //       'https://api.openai.com/v1/threads/thread_XcMQNBdbH3HyneptBJYwyJRJ/messages');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${Env.openAiApiKey}',
  //     'OpenAI-Beta': 'assistants=v2',
  //   };
  //
  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     // return jsonDecode(response.body)['data'][0]['content'][0]['text']
  //     //     ['value'];
  //     final bytesData = utf8.decode(response.bodyBytes);
  //     final data = jsonDecode(bytesData)['data'] as List;
  //     // final text = data.map((e) => e['content']).map((e) => e['text']).toList();
  //     final contentList = data.map((e) => e['content'] as List);
  //     final text = contentList.expand((e) => e.map((e) => e['text']));
  //     return text.map((e) => TextDto.fromJson(e)).toList();
  //   } else {
  //     return [];
  //   }
  // }
  Future<List<DataDto>> getDataDto() async {
    final url =
        Uri.parse('https://api.openai.com/v1/threads/$globalThreadId/messages');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Env.openAiApiKey}',
      'OpenAI-Beta': 'assistants=v2',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // return jsonDecode(response.body)['data'][0]['content'][0]['text']
      //     ['value'];
      final bytesData = utf8.decode(response.bodyBytes);
      final data = jsonDecode(bytesData)['data'] as List;
      // final text = data.map((e) => e['content']).map((e) => e['text']).toList();
      // final contentList = data.map((e) => e['content'] as List);
      // final text = contentList.expand((e) => e.map((e) => e['text']));

      return data.map((e) => DataDto.fromJson(e)).toList();
    } else {
      throw Exception('error');
    }
  }
}
