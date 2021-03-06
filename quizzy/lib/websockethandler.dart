import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';

WebSocketsNotifications sockets = new WebSocketsNotifications();

const String _SERVER_ADDRESS = "ws://192.168.1.15:34263";

const String SERVER_ADDRESS = "ws://73.169.148.60:34263";

//192.168.40.217


class WebSocketsNotifications {
  static final WebSocketsNotifications _sockets = new WebSocketsNotifications._internal();

  factory WebSocketsNotifications(){
    return _sockets;
  }

  WebSocketsNotifications._internal();

  IOWebSocketChannel _channel;
  
  bool _isOn = false;

  ObserverList<Function> _listeners = new ObserverList<Function>();
  initCommunication() async {
    reset();
    try {
      _channel = new IOWebSocketChannel.connect(_SERVER_ADDRESS);
      _channel.stream.listen(_onReceptionOfMessageFromServer);
    } catch(e){
      // TODO
    }
  }

  reset(){
    if (_channel != null){
      if (_channel.sink != null){
        _channel.sink.close();
        _isOn = false;
      }
    }
  }

  send(String message){
    if (_channel != null){
      if (_channel.sink != null && _isOn){
        _channel.sink.add(message);
      }
    }
  }

  addListener(Function callback){
    _listeners.add(callback);
  }
  removeListener(Function callback){
    _listeners.remove(callback);
  }

  _onReceptionOfMessageFromServer(message){
    _isOn = true;
    _listeners.forEach((Function callback){
      callback(message);
    });
  }
}
