# My E-Commerce Project

A Ruby on Rails e-commerce application featuring user authentication, cart functionality, product filtration, pagination, searching, product ratings and comments, comment replies, and payment processing with Stripe.

## Features

- **User Authentication:** Users can register, log in, and manage their accounts.
- **Cart Functionality:** Users can add products to their cart, view, and modify it.
- **Product Filtration:** Filter products by price (low to high or high to low).
- **Pagination:** Navigate through products and other resources in pages.
- **Searching:** Search for products by name or description.
- **Product Ratings and Comments:** Users can rate and comment on products. Other users can reply to comments.
- **Order and Payment:** Users can place orders and make payments via Stripe.

## Setup Instructions

### Prerequisites

- Ruby 3.3.4
- Rails 7.2.0
- SQLite3
- Stripe API keys

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/MuhammadSajid368/ruby-on-rails-test-project.git
    ```

2. **Navigate into the project directory:**

    ```bash
    cd project
    ```

3. **Install dependencies:**

    ```bash
    bundle install
    ```

4. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

5. **Configure environment variables:**

    Create a `.env` file in the root directory and add your environment variables. For Stripe, add your API keys:

    ```bash
    STRIPE_TEST_PUBLISHABLE_KEY= pk_test_51PLTOFSHTh3bUTEyp3zufIqiu9ahyCF7aJcHR1oCaBZaeS3F4LWCr70URKEQigxahUkZroIv9XqwtN1PnrxFIuGF00GDxdpfQf
    STRIPE_TEST_SECRET_KEY= sk_test_51PLTOFSHTh3bUTEyfzTBA0TT3eRHfdSPg3jFVSNxwc8AZGPrIIfTeVypp9P1yN1vURHwRIvUP5WYypuI84QTOrtn00kWR7apjT
    ```

    For local development, you can use the `dotenv-rails` gem to load these variables.

6. **Run the Rails server:**

    ```bash
    rails server
    ```

    Visit `http://localhost:3000` in your browser to see the application.

### Configuration

If you are using Stripe, ensure you have set up your Stripe API keys correctly and configured your Rails application to handle payments. 

### Usage

- **User Authentication:** Register or log in to access user-specific features.
- **Cart Functionality:** Browse products, add them to your cart, and manage your cart from the navigation menu.
- **Filtration and Searching:** Use the filtering options to sort products by price and use the search bar to find specific products.
- **Ratings and Comments:** Navigate to a product page to add a rating or comment. Reply to comments on the product page.
- **Order and Payment:** Add items to your cart, proceed to checkout, and use Stripe to complete your payment.

### Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request with your changes. For major changes, please open an issue first to discuss what you would like to change.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contact

For any questions, please reach out to muhammadsajid936303@gmail.com(mailto:muhammadsajid936303@gmail.com).
