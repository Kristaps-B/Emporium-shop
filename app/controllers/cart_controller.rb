class CartController < ApplicationController
    before_filter :initialize_cart
    
    def add
     params[:id].gsub!(/book_/, "")
    @book = Book.find(params[:id])   
    @book = Book.find(params[:id])
    if request.xhr?
        @item = @cart.add(params[:id])
        flash.now[:cart_notice] = "<span class='glyphicon glyphicon-bell'></span> Added <em>#{@item.book.title}</em>".html_safe
        render :action => "add_with_ajax"
    elsif request.post?
        @item = @cart.add(params[:id])
        flash[:cart_notice] = "<span class='glyphicon glyphicon-bell'></span> Added <em>#{@item.book.title}</em>".html_safe
        redirect_to session[:return_to] || {:controller => "catalog"}
    else
    render
    end
    end
    
    
    def remove
        @book = Book.find(params[:id])
        if request.xhr?
            puts ">>>>>>>>>>>> REQUEST XHR?"
            
            @item = @cart.remove(params[:id])
            
            puts "----------------"
            puts @item.id
            puts "----------------"
            
            flash.now[:cart_notice] = "<span class='glyphicon glyphicon-bell'></span> Removed 1 <em>#{@item.book.title}</em>".html_safe
            render :action => "remove_with_ajax"
        elsif request.post?
            @item = @cart.remove(params[:id])
            flash[:cart_notice] = "<span class='glyphicon glyphicon-bell'></span> Removed 1 <em>#{@item.book.title}</em>".html_safe
            redirect_to :controller => "catalog"
        else
            render
        end
end
    
 def clear
    if request.xhr?
        @cart.cart_items.destroy_all
        flash.now[:cart_notice] = "<span class='glyphicon glyphicon-bell'></span> Cleared the cart".html_safe
        render :action => "clear_with_ajax"
    elsif request.post?
        @cart.cart_items.destroy_all
        flash[:cart_notice] = "<span class='glyphicon glyphicon-bell'></span> Cleared the cart".html_safe
        redirect_to :controller => "catalog"
    else
        render
    end
end
    
    
end
