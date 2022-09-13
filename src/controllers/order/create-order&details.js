const CON_createOrder = ({ createOrder, createOrderDetails }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        };
        try {
            //get the httprequest body
            const { source = {}, ...Info } = httpRequest.body;
            source.ip = httpRequest.ip;
            source.browser = httpRequest.headers["User-agent"];

            //process create delivery trans first to get delivery_id
            const order = await createOrder(Info.order)

            //orders type=array
            const order_details = Info.order_details

            //pass data to createProduct with delivery_id
            const data = {
                order_id: order.order_id,
                order_details
            }
            // console.log(data)

            //process create products
            const orderDetails = await createOrderDetails(data)

            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 201,
                body: {
                    message: order.message + ' and ' + orderDetails

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