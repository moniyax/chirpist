class RegistrationsController < Devise::RegistrationsController
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  private

  def sign_up_params
    params.require(:user).permit(:moniker, :fullname, :description, :email, :password, :password_confirmation, :avatar_key)
  end

  def account_update_params
    params.require(:user).permit(:moniker, :fullname, :description, :email, :password, :password_confirmation, :current_password, :avatar_key)
  end

  def set_s3_direct_post
    logger.debug 'Setting presigned bucket'
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
