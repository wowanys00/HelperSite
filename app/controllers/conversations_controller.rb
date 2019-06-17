class ConversationsController < ApplicationController
    before_action :authenticate_user!
    def index
     @users = User.all
     @conversations = Conversation.all
     end
    def create
     if Conversation.between(params[:sender_id],params[:recipient_id])
       .present?
        @conversation = Conversation.between(params[:sender_id],
         params[:recipient_id]).first
     else
      @conversation = Conversation.create!(conversation_params)
     end
     redirect_to conversation_messages_path(@conversation)
    end
    private
     def conversation_params
      params.permit(:sender_id, :recipient_id)
     end
end
    #Here we use a scope method, between, when the create action is called, the between method checks to see if a conversation between these 2 users exists…only if one does not already exist is the conversation created. Our messages controller :
    