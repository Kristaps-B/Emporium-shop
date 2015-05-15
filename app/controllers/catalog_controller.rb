class CatalogController < ApplicationController
    
    before_filter :initialize_cart
    
  def index
      @page_title = "Book List"
@books = Book.paginate(:page => params[:page], :per_page => 10)
.order("books.id desc")
  end

  def show
      @book = Book.find(params[:id]) rescue nil
    return render(:text => "Not found", :status => 404) unless @book
    @page_title = @book.title
      
      
      
      @user = User.find(session[:user_id])
      
       @comments = Comment.where(['book_id = ?', @book.id])
      @comments = @comments.reverse
      
      puts "========================================================"
      puts @comments
      
      
      
      @comments.each do |item|
        puts "----------------------------"
        puts item.txt
        puts User.find(item.user_id).email
        puts "---------------------------"

      end
    
      
      
  end

  def search
  end

  def latest
        @page_title = "Latest Books"
        @books = Book.latest
  end
    
    
    def  ajax_show
        @book = Book.find(5)
        puts params[:id]
        @comment = Comment.new
        @comments = Comment.where(['book_id = ?', @book.id])
        
        render 'comment/comment_with_ajax'
    end
end
