class ChecklistsController < ApplicationController
	before_action :authenticate_user!

  def index
    @todos = Todo.all
    @checklist = current_user.checklists
    @user = User.all
  end

  def create
    @todo = Todo.find(params[:todo_id])
    @checklist = Checklist.find_by(todo: @todo, user: current_user)
    if @checklist == nil
      @checklist = Checklist.create(todo: @todo, user: current_user)
    end
    if @checklist.save
      redirect_to root_path, notice: 'Has completado esta tarea'
    else
      redirect_to root_path, alert: 'No se ha podido marcar como completada esta tarea'
    end
  end

  def edit
    @checklist = checklist.find(params[:id])
  end

  def update
    @checklist = checklist.find(params[:id])
    @checklist.update(checklists_params)
    redirect_to root_path
  end

  def complete
    @checklist = checklist.find(params[:id])
    @checklist.checklist = true
    @checklist.save
    redirect_to checklists_path
  end

  private

  def checklist_params
    params.require(:done).permit(:done)
  end
end
