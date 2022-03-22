class InquiryMailer < ApplicationMailer
  def send_when_company_reply(current_user, inquiry_reply)
    @user = current_user
    @answer = inquiry_reply.content

    inquiry_reply.files.each do |file|
      attachments[file.filename] = File.read("public/uploads/#{file.model.class.to_s.underscore}/#{file.mounted_as}/#{file.model.id}/#{file.filename}")
    end

    mail to: @user.email, subject: '【サイト名】 お問い合わせありがとうございます'
  end
end
