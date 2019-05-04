class S3Controller < ApplicationController
  def signed_s3
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')

    data = {
      url: @s3_direct_post.url,
      form_data: @s3_direct_post.fields,
    }

    render json: data, status: :ok
  end
end
