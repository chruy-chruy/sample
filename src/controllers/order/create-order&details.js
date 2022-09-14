const CON_createOrder = ({ createOrder, createOrderDetails, createCustomer }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        };
        try {
            //get the httprequest body
            const { source = {}, ...Info } = httpRequest.body;
            source.ip = httpRequest.ip;
            source.browser = httpRequest.headers["User-agent"];

            //process create delivery first to get delivery_id
            const order = await createOrder(Info.order)

            //pass product details to createProduct with delivery_id
            const order_details = {
                order_id: order.order_id,
                order_details: Info.order_details
            }
            //process create products
            const orderDetails = await createOrderDetails(order_details)

            //pass customer details to createProduct with delivery_id
            const customer = {
                order_id: order.order_id,
                customer: Info.customer
            }

            //process add customer
            const addcustomer = await createCustomer(customer)

            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 201,
                body: {
                    order: order.message,
                    order_details: orderDetails,
                    customer: addcustomer
                }

            };
            // console.log(result.body);
            return result

        } catch (e) {
            console.log(e.message)
            return {
                headers,
                statusCode: 400,
                body: {
                    error: e.message
                }
            }
        }
    }
}

module.exports = CON_createOrder