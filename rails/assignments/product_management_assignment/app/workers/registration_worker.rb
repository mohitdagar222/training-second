class RegistrationWorker
    include Sidekiq::Worker
    def perform(id)
        @user = User.find_by(id: id)
        UserMailer.welcome_email(@user).deliver
    end
 end