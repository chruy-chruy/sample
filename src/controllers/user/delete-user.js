
const CON_deleteUser = ({ deleteUser }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        }; try {
            //get the httprequest body
            const { source = {}, ...UserInfo } = httpRequest.body;
            if (httpRequest.headers["Referer"]) {
                source.referrer = httpRequest.headers["Referer"];
            }

            const toDelete = {
                id: httpRequest.params.id,
            }

            const user = await deleteUser(toDelete);
            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 200,
                body: {
                    message: "Deleted succesfully",
                    user
                }
            };
            console.log(result.body)
            return result;
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

module.exports = CON_deleteUser