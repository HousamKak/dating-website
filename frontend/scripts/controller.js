// navigator.geolocation.getCurrentPosition(showPosition);
const dating_pages = {};

dating_pages.baseURL = "http://127.0.0.1:8000/api";

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

dating_pages.getAPI = (api_url) => {
  try {
    return axios(api_url);
  } catch (error) {
    dating_pages.Console("Error from GET API", error);
  }
};

dating_pages.postAPI = (api_url, api_data, api_token = null) => {
  return axios.post(api_url, api_data, {
    headers: {
      Authorization: "token " + api_token,
    },
  });
};

dating_pages.loadFor = (page) => {
  eval("dating_pages.load_" + page + "();");
};

dating_pages.load_landing = () => {
  // Get the signup button
  const SIGNUP = document.getElementById("SIGNUP");

  // Get the signup input fields
  const FAV_GENDER = document.getElementById("FAV-GENDER");
  const NAME = document.getElementById("NAME");
  const EMAIL = document.getElementById("EMAIL");
  const AGE = document.getElementById("AGE");
  const GENDER = document.getElementById("GENDER");
  const PASSWORD = document.getElementById("PASSWORD");
  // Listen to the signup click

  SIGNUP.addEventListener("click", () => {
    const signup_url = dating_pages.baseURL + "/signup";
    const signup_message = document.getElementById("signup-message");
    const params = new URLSearchParams();
    params.append("name", NAME.value);
    params.append("email", EMAIL.value);
    params.append("age", AGE.value);
    params.append("gender", GENDER.options[GENDER.selectedIndex].value);
    params.append(
      "favorite_gender",
      FAV_GENDER.options[FAV_GENDER.selectedIndex].value
    );
    params.append("password", PASSWORD.value);

    axios({ method: "post", url: signup_url, data: params }).then((object) => {
      if (object.data.result == "email already registered") {
        signup_message.textContent = "email already registered";
      } else if (object.data.result == "invalid email") {
        signup_message.textContent = "invalid email";
      } else {
        signup_message.textContent = "Registration succeeded Please log In";
      }
    });
  });
};

// dating_pages.load_profile = () => {};
// dating_pages.load_chat = () => {};
// dating_pages.load_favorites = () => {};
// dating_pages.load_feed = () => {};
