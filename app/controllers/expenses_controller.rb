class ExpensesController < ApplicationController

  before_action :authenticate_user!

  def index
     @expenses = Expense.order("date DESC")
     unless params[:category_id].blank? && params[:concept].blank?
       if params[:concept].blank?
         @expenses = Expense.where(category_id: params[:category_id]).order("date DESC")
       elsif params[:category_id].blank?
         @expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%").order("date DESC")
       else
         @expenses = Expense.where("concept LIKE ? AND category_id=?", "%#{params[:concept]}%", params[:category_id]).order("date DESC")
       end

       #@expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%").order("date DESC")

     end


  end
end
