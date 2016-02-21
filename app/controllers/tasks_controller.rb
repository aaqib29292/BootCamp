# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TasksController < ApplicationController
  def index

    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Successfully created a task"
      redirect_to tasks_path
    else
      flash.now[:error] = "Something went wrong, Try again"
      render :new
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :description)

    end
end
