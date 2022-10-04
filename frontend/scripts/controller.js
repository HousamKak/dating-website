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
  const IN_EMAIL = document.getElementById("IN-EMAIL");
  const IN_PASSWORD = document.getElementById("IN-PASSWORD");
  const LOGIN = document.getElementById("LOGIN");
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

  // Listen to sign in click
  LOGIN.addEventListener("click", () => {
    const signin_url = dating_pages.baseURL + "/signin";
    const signin_params = new URLSearchParams();
    signin_params.append("email", IN_EMAIL.value);
    signin_params.append("password", IN_PASSWORD.value);
    const signin_message = document.getElementById("signin-message");
    axios({ method: "post", url: signin_url, data: signin_params }).then(
      (object) => {
        x = "Sign in: ";
        if (object.data.result == "invalid email") {
          signin_message.textContent = x + "invalid email";
        } else if (object.data.result == "invalid password") {
          signin_message.textContent = x + "invalid password";
        } else if (object.data.result == "email not registered") {
          signin_message.textContent = x + "email not registered";
        } else {
          window.location.href = "/html pages/feed.html";
          localStorage.setItem("user_id", JSON.stringify(object.data.result));
        }
      }
    );
  });
};

dating_pages.load_profile = () => {
  const user_id = JSON.parse(localStorage.getItem("user_id"));
  const user_info_url = dating_pages.baseURL + "/user/info";
  const profile_params = new URLSearchParams();
  profile_params.append("user_id", user_id);

  // write to
  const write_name = document.getElementById("write-name");
  const write_email = document.getElementById("write-email");
  const write_age = document.getElementById("write-age");
  const write_gender = document.getElementById("write-gender");
  const write_favgender = document.getElementById("write-favgender");
  const write_profile = document.getElementById("PROFILE-PHOTO");

  axios({ method: "post", url: user_info_url, data: profile_params }).then(
    (object) => {
      write_name.textContent = object.data.result.name;
      write_email.textContent = object.data.result.email;
      write_age.textContent = object.data.result.age;
      write_gender.textContent = object.data.result.gender;
      write_favgender.textContent = object.data.result.favorite_gender;
      write_profile.src = object.data.result.picture;
    }
  );

  // get from
  const profile_name = document.getElementById("PROFILE-NAME");
  const profile_photo_path = document.getElementById("PROFILE-PHOTO-path");
  const profile_age = document.getElementById("PROFILE-AGE");
  const profile_gender = document.getElementById("PROFILE-GENDER");
  const profile_favgender = document.getElementById("PROFILE-FAVGENDER");
  const update_profile = document.getElementById("UPDATE-PROFILE");
  const update_profile_url = dating_pages.baseURL + "/user/update";

  update_profile.addEventListener("click", () => {
    const new_profile_params = new URLSearchParams();
    new_profile_params.append("user_id", user_id);
    new_profile_params.append("name", profile_name.value);
    new_profile_params.append("age", profile_age.value);
    new_profile_params.append("picture", profile_photo_path.value);
    new_profile_params.append("gender", profile_gender.value);
    new_profile_params.append("favorite_gender", profile_favgender.value);
    axios({
      method: "post",
      url: update_profile_url,
      data: new_profile_params,
    });
    write_name.textContent = profile_name.value;
    write_age.textContent = profile_age.value;
    write_gender.textContent = profile_gender.value;
    write_favgender.textContent = profile_favgender.value;
    // profile_photo.src
    console.log(profile_photo);
  });
};
dating_pages.load_chat = () => {};
dating_pages.load_favorites = () => {};
dating_pages.load_feed = () => {};
