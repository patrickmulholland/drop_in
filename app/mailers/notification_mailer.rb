class NotificationMailer < ActionMailer::Base
  default from: "patrick.mulholland@gmx.de"
  
  def reply_notification(reply)
    @receiver = reply.event.user.name
    @sender = reply.user.name
    @message = reply.message
    @event_short_desc = reply.event.short_description
    
    mail(:to => reply.event.user.email)
  end
  
  def invitation_notification(reply)
    @sender = reply.event.user.name
    @receiver = reply.user.name
    @event_short_desc = reply.event.short_description
    
    mail(:to => reply.user.email)
  end
  
  def commit_notification(reply)
    @receiver = reply.event.user.name
    @sender = reply.user.name
    @message = reply.message
    @event_short_desc = reply.event.short_description
    
    mail(:to => reply.event.user.email)
  end
  
  def comment_notification(comment)
    @receiver = comment.event.user.name
    @sender = comment.user.name
    @content = comment.content
    @event_short_desc = comment.event.short_description
    
    mail(:to => comment.event.user.email)
  end
  
  def contact_form(message)
    @sender = message.name
    @topic = message.topic
    @email = message.email
    @content = message.content
  
    mail(:to => "patrick.mulholland@gmx.de")
  end
  
end
