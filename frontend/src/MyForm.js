import React from "react";
import { Formik } from "formik";
import * as Yup from "yup";
import axios from "axios";
import qs from 'qs';
import Notifications, {notify} from 'react-notify-toast';

// Inspired by https://medium.com/dailyjs/why-build-your-forms-with-redux-form-bcacbedc9e8 about forms, also by https://blog.stvmlbrn.com/2017/04/07/submitting-form-data-with-react.html about the states
const MyForm = () => (
  <div className="app">
    <Notifications />

    <h1>Email Form</h1>

    <Formik
      initialValues={{ email: "", message: "" }}
      onSubmit={(values, { setSubmitting }) => {
        setTimeout(() => {
          // Solution to use qs.stringify for posting json - https://github.com/axios/axios/issues/1440 by JustinBeckwith - without this extra unwanted characters of \ or \n added
          axios.post("http://localhost:4000/v1/examples", qs.stringify(values)).then(response => {
            if (response.status === 200) {
              // .
            } else {
              // throw error and go to catch block
              throw new Error("Error");
            }
          }).catch(error => {
            //when throw "Error" is executed it runs the catch block code
            console.log(error)
          });

          setSubmitting(false);
        }, 500);
      }}
      validationSchema={Yup.object().shape({
        email: Yup.string()
          .email()
          .required("Email is required")
      })}
    >

      {props => {
        // Adding function inside const method - https://stackoverflow.com/questions/40561199/es6-how-to-define-functions-inside-a-const

        // You can declare another arrow function if you want:
        // The improvement is to trigger notification based on axios post response
        const submit_button_clicked = () => notify.show('The email has been sent!', "custom", 4000, { background: 'rgba(57, 225, 175, 0.85)', opacity: 0.8, text: "#FFFFFF" });

        // Or a standard function
        // function bar() { console.log('standard'); }

        const {
          values,
          touched,
          errors,
          isSubmitting,
          handleChange,
          handleBlur,
          handleSubmit
        } = props;

        // Removed consts:
        // dirty,
        // handleReset

        return (
          <form onSubmit={handleSubmit}>
            <label htmlFor="email" style={{ display: "block" }}>
              Contact Us
            </label>
            <input
              id="email"
              placeholder="Enter your email"
              type="text"
              value={values.email}
              onChange={handleChange}
              onBlur={handleBlur}
              className={
                errors.email && touched.email
                  ? "text-input error"
                  : "text-input"
              }
            />

            <textarea id="message"
              placeholder="Enter your message"
              type="text"
              value={values.message}
              onChange={handleChange}
              onBlur={handleBlur}>
            </textarea>

            {errors.email && touched.email && (
              <div className="input-feedback">{errors.email}</div>
            )}

            {/*
            <button
              type="button"
              className="outline"
              onClick={handleReset}
              disabled={!dirty || isSubmitting}
            >
              Reset
            </button>
            */}

            <button type="submit" onClick={submit_button_clicked} disabled={isSubmitting}>
              Send
            </button>

          </form>
        );

      }}

    </Formik>

  </div>
);

export default MyForm;
