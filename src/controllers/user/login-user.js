const CON_loginUser = ({ loginUser }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        };
        try {
            //get the httprequest body
            const { source = {}, ...UserInfo } = httpRequest.body;
            source.ip = httpRequest.ip;
            source.browser = httpRequest.headers["User-agent"];
            const data = await loginUser(UserInfo);
            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 200,
                body: {
                    message: "Login Successful",
                    User: data
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

module.exports = CON_loginUser