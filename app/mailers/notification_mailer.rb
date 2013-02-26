class NotificationMailer < ActionMailer::Base
  default from: "patrick.mulholland@gmx.de"
  
  def reply_notification(reply)
    @receiver = reply.event.user.name
    @sender = reply.user.name
    @message = reply.message
    @event_short_desc = reply.event.short_description
    
    mail(:to => reply.event.user.email, :subject => "Drop.in - You have a new Reply to one of your Events")
  end
  
  def invitation_notification(reply)
    @sender = reply.event.user.name
    @receiver = reply.user.name
    @event_short_desc = reply.event.short_description
    
    mail(:to => reply.user.email, :subject => "Drop.in - You have a new Invitation waiting")
  end
  
  def commit_notification(reply)
    @receiver = reply.event.user.name
    @sender = reply.user.name
    @message = reply.message
    @event_short_desc = reply.event.short_description
    
    mail(:to => reply.event.user.email, :subject => "Drop.in - You have a new Commit to one of your Events")
  end
  
  def comment_notification(comment)
    @receiver = comment.event.user.name
    @sender = comment.user.name
    @content = comment.content
    @event_short_desc = comment.event.short_description
    
    mail(:to => comment.event.user.email, :subject => "Drop.in - You have a new Comment on one of your Events")
  end
  
  
end
