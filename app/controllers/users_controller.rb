class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  	@user=User.all
  end

  def new_db_config
  	@line_wise = File.read("config/database.yml").split("\n")
  end

  def save_db_config
  	if params[:host]=="ip"
      params[:host]=params[:host_ipentered]
    end
    @i_db=@e_db="  adapter:  #{params[:adapter]}\n  host:  #{params[:host]}\n"
    params[:development].each do |x|
      @i_db+=("  "+x[0].gsub('"','')+":  "+x[1])+"\n"
    end
    params[:external].each do |x|
      @e_db+=("  "+x[0].gsub('"','')+":  "+x[1])+"\n"
    end
    File.open("#{Rails.root}"+"/config/database.yml","w+") do |f|
      f.write("development:\n#{@i_db}\n\n\nexternal:\n#{@e_db}")
    end
    dbconfig = YAML::load(File.open("#{Rails.root}"+"/config/database.yml"))
    ActiveRecord::Base.establish_connection(dbconfig["development"])
    redirect_to :action=>'new_db_config'
  end

end
