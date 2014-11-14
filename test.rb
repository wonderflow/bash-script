#!/usr/bin/ruby
# encoding: utf-8

require 'net/smtp'

message = <<MESSAGE_END
From: wonderflow<wonderflow@163.com>
To: JJ<jiangjun132@zju.edu.cn>
Subject: This is an auto sent email

Hi 俊哥,
    这是一封服务器定时自动发送的邮件。
    每晚十点半发送给你提醒你回宿舍。
    请不要回复我。

Regards!
Sun

MESSAGE_END

num = 1 
flag = 0
hour = 22
minute = 30

loop do
  t = Time.now
  sleep 5
  next if flag==1 && t.hour==hour
  flag = 0
  next unless (t.hour==hour && t.min==minute)
  flag = 1
  Net::SMTP.start('localhost') do |smtp|
    smtp.send_message message, 'wonderflow@wonderflow.info', 
    'jiangjun132@zju.edu.cn'
  end
  p "#{num} email sent."
end
