// navigator.geolocation.getCurrentPosition(showPosition);
const dating_pages = {};

dating_pages.baseURL = "http://127.0.0.1:8000/api/v0.1";

dating_pages.Console = (title, values, oneValue = true) => {
  console.log("---" + title + "---");
  if (oneValue) {
    console.log(values);
  } else {
    for (let i = 0; i < values.length; i++) {
      console.log(values[i]);
    }
  }
  console.log("--/" + title + "---");
};

dating_pages.getAPI = async (api_url) => {
  try {
    return await axios(api_url);
  } catch (error) {
    dating_pages.Console("Error from GET API", error);
  }
};

dating_pages.postAPI = async (api_url, api_data, api_token = null) => {
  try {
    return await axios.post(api_url, api_data, {
      headers: {
        Authorization: "token " + api_token,
      },
    });
  } catch (error) {
    dating_pages.Console("Error from POST API", error);
  }
};

dating_pages.loadFor = (page) => {
  eval("dating_pages.load_" + page + "();");
};

dating_pages.load_landing = async () => {
  const landing_url = `${dating_pages.baseURL}/landing`;
  const response_landing = await dating_pages.getAPI(landing_url);
  dating_pages.Console("Testing Products API", response_landing.data.data);
//   window.location.href = "/frontend/favorites.html";
};

dating_pages.load_profile = () => {};
dating_pages.load_chat = () => {};
dating_pages.load_favorites = () => {};
dating_pages.load_feed= () => {};
