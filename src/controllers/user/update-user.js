// const { updateUser } = require("../../use-cases/user");

const updateUserController = ({ updateUser }) => {
    return async function get(httpRequest) {
        const headers = {
            "Content-Type": "application/json",
        }; try {
            //get the httprequest body
            const { source = {}, ...UserInfo } = httpRequest.body;
            if (httpRequest.headers["Referer"]) {
                source.referrer = httpRequest.headers["Referer"];
            }

            const toUpdate = {
                id: httpRequest.params.id,
                password: UserInfo.password
            }

            const user = await updateUser(toUpdate);
            const result = {
                headers: {
                    "Content-Type": "application/json"
                },
                statusCode: 200,
                body: {
                    message: "updated succesfully",
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

module.exports = updateUserController