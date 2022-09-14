const CON_getOrder = ({ getOrder }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        }; try {
            //get the httprequest body
            // if (httpRequest.headers["Referer"]) {
            //     source.referrer = httpRequest.headers["Referer"];
            // }

            const result = await getOrder();

            return {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 200,
                body: result
            };
        } catch (e) {
            console.log(e)
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

module.exports = CON_getOrder