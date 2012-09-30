class NeedhelpController < ApplicationController
  def create
  	create_or_edit(current_user, params)
    redirect_to user_path(current_user.id)
  end 

  private
    def create_or_edit(current_user, params)
    	repo = Repo.find_by_github_id(params[:id])

    	if repo
    		repo.description = params[:description]
    		repo.forks = params[:forks]
		  	repo.watchers = params[:watchers]
		  	repo.open_issues = params[:open_issues]
		  	repo.pushed_at = params[:pushed_at]
		  	if(repo.need_help)
		  		repo.need_help = false
		  	else
		  		repo.need_help = true
		  	end
    		repo.save
    	else
	    	repo = Repo.new
		  	repo.user_id = current_user.id
		  	repo.name = params[:name]
		  	repo.github_url = params[:github_url]
		  	repo.need_help = params[:need_help]
		  	repo.created_at = params[:created_at]
		  	repo.updated_at = params[:updated_at]
		  	repo.github_id = params[:id]
		  	repo.full_name = params[:full_name]
		  	repo.description = params[:description]
		  	repo.language = params[:language]
		  	repo.forks = params[:forks]
		  	repo.watchers = params[:watchers]
		  	repo.open_issues = params[:open_issues]
		  	repo.pushed_at = params[:pushed_at]
		  	repo.need_help = true
		  	repo.save
		end
    end
end