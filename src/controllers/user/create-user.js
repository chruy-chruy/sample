const CON_createUser = ({ createUser }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        };
        try {
            //get the httprequest body
            const { source = {}, ...UserInfo } = httpRequest.body;
            source.ip = httpRequest.ip;
            source.browser = httpRequest.headers["User-agent"];

            const res = await createUser(UserInfo);
            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 200,
                body: { res }
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

module.exports = CON_createUser