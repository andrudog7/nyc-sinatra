class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do 
    erb :'/figures/new'
  end

  post '/figures' do 
    @figure = Figure.create(params[:figure])  
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch "/figures/:id" do 
    @figure = Figure.find_by_id(params[:id])
    
    @figure.update(params[:figure])
    # if params[:figure].include?(:title_ids)
    #   @figure.titles.each do |title|
    #     title.update(params[:figure][:title_ids])
    #   end
    # end
    #   if params[:figure].include?(:landmark_ids)
    #     @figure.landmarks.each do |landmark|
    #       landmark.update(params[:figure][:landmark_ids])
    #     end
    #   end
      if !params["title"]["name"].empty?
        @figure.titles << Title.create(params[:title])
      end
      if !params["landmark"]["name"].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      @figure.save
  end
end
