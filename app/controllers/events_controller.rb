class EventsController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = case params[:filter]
              when 'past'
                Event.past
              when 'free'
                Event.free
              when 'recent'
                Event.recent
              else
                Event.upcoming
              end
  end

  def show
    @likers = @event.likers
    @categories = @event.categories
    @like = current_user.likes.find_by(event_id: @event.id) if current_user
  end

  def edit; end

  def update
    if @event.update(event_params)
      # flash[:notice] = 'Event successfully updated!'
      redirect_to @event, notice: 'Event successfully updated!'
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event successfully created!'
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find_by!(slug: params[:id])
  end

  def event_params
    params.require(:event)
          .permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name, category_ids: [])
  end
end
