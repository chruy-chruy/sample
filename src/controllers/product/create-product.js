const CON_createProduct = ({ createProduct }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        };
        try {
            //get the httprequest body
            const { source = {}, ...ProductInfo } = httpRequest.body;
            source.ip = httpRequest.ip;
            source.browser = httpRequest.headers["User-agent"];

            const body = await createProduct(ProductInfo)

            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 201,
                body: body
            };
            console.log(result.body);
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

module.exports = CON_createProduct