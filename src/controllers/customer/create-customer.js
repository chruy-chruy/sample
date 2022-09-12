const CON_createCustomer = ({ createCustomer }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        };
        try {
            //get the httprequest body
            const { source = {}, ...CustomerInfo } = httpRequest.body;
            source.ip = httpRequest.ip;
            source.browser = httpRequest.headers["User-agent"];

            await createCustomer(CustomerInfo)
                .catch(err => { console.log("error at controller query " + err) });

            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 200,
                body: {
                    message: "Customer Added succesfully",
                }
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

module.exports = CON_createCustomer