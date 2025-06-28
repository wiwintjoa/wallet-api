module Api
    module V1
        class CustomersController < ApplicationController
            #Get /api/v1/customers
            def index
                customers = Customer.all
                render json: customers
            end

            # GET /api/v1/customers/:id
            def show
                customer = Customer.find(params[:id])
                render json: customer
            end

            # POST /api/v1/customers
            def create
                customer = Customer.new(customer_params)
                if customer.save
                    render json: customer, status: :created
                else
                    render json: { errors: customer.errors.full_messages },status: :unprocessable_entity
                end
            end

            #PUT/PATCH /api/v1/customers/:id
            def update
                customer = Customer.find(params[:id])
                if customer.update(customer_params)
                    render json: customer
                else
                    render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
                end
            end

            # DELETE /api/v1/customers/:id
            def destroy
                customer = Customer.find(params[:id])
                customer.destroy
                head :no_content
            end

            private 

            def customer_params
                params.require(:customer).permit(:name, :email)
            end

        end
    end
end            