class CommentController < ApplicationController
    
    
    def create 
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" 
        puts params[:comment][:txt]
        puts params[:user_id]
        puts params[:book_id]
        puts params[:comment][:rating]
        
        
        @comment = Comment.new
        
        @comment.txt = params[:comment][:txt]
        @comment.user = User.find(params[:user_id])
        @comment.book = Book.find(params[:book_id])
        
        @comment.rating = params[:comment][:rating]
        
        if request.xhr?
           if @comment.save
                puts "####################################################"
                puts "Ar AJAX!"
                puts "####################################################"
               
                flash.now[:comment_notice] = "Comment was successfully created."
                #redirect_to :controller => 'catalog', :action => 'show', :id => @comment.book_id
                
                 #render :action => "comment_with_ajax"
              #redirect_to :controller => 'catalog', :action => 'ajax_show'
               
              
               @book = Book.find(params[:book_id])
               
                @comment = Comment.new
                @comments = Comment.where(['book_id = ?', @book.id])
               
               @comments = @comments.reverse
               
               
                render :action => "comment_with_ajax"
            end
        elsif
        
            if @comment.save
                flash[:comment_notice] = "Comment was successfully created."
                redirect_to :controller => 'catalog', :action => 'show', :id => @comment.book_id
            else
                redirect_to :controller => 'catalog', :action => 'show', :id => @comment.book_id
            end
        end
        
        
        
        
    end
end
