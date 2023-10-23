class Api::V1::CommunityPostsController < ApplicationController
  def index
    posts = Community.find_by(id: index_params[:community]).community_posts
    if posts.present?
      render json: { posts: posts }, status: :ok
    else
      render json: { errors: posts.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    user_id = User.find_by(auth_token: create_params[:auth_token]).id
    community = Community.find(create_params[:community_id])
    if user_id.present? && community.present?
      community_post = CommunityPost.new(user_id: user_id, community_id: community_id, body: create_params[:body], issue: create_params[:issue])
      if community_post.save
        render json: { posts: "Se creo el post" }, status: :ok
      else
        render json: { errors: community_post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private 

  def index_params 
    params.permit(:community)
  end

  def create_params 
    params.permit(:auth_token, :community_id, :issue, :body)
  end
end
