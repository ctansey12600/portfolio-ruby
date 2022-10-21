# Casey Tansey Portfolio

This project was created with the intention of being used as my Phase 2 Project in the Software Engineering Program at Flatiron. The guidelines included creating single-page application to demonstrate knowledge of Javascript, React, and HTML/CSS. Within the application, `json-sever` had to be used to create a RESTful API. With the guidelines set, I decided to make an application to use as my portfolio to demonstrate my work in both Website Development and Graphic Design.

The purpose of developing this website was to show attributions of myself through design. This fits in terms of color scheme, typography, and overall layout and aesthetic. When creating the design of the application, Procreate and Canva were used to come up with rough blueprints of designs that would fit my "character." Figma was the used to create the first "official" layout, and eventually the final UI layout of the design. When implementing the design, [styled-components][0] was used with react to implement a dynamic flow.

However, this project was then updated to reflect principles learned within Phase 3 in the Software Engineering Program at Flatiron; this project has now been updated to use for my Phase 3 Project. The guidelines included building an API with Sinatra and Active Record to support a React frontend. With a React frontend primarily already built, I was able to add more functionality and a dynamic flow to the app. By building a Sinatra API backend that uses Active Record, I was able to add a new section within the contact page. When going to this page, a user is now able to submit a question which will then be recorded in a database and also within the Question/Answer Section. To see more on the Question/Answer Section, read more on the section below.

![HomePageGif](https://media.giphy.com/media/wI9dnwZUKivnoHERP2/giphy.gif)

**To open this repository:**

1. Fork and clone
2. Input into terminal to enter server first

```
$ cd casey-tansey-ruby/
$ bundle install
$ bundle exec rake db:migrate db:seed:replant
$ bundle exec rake server
```

3. Open another terminal and enter to start client

```
$ npm install
$ npm start
```

4. Navigate to Application

### **Question & Answer**

---

The question and answer section holds the questions that have been submitted in the form along with the name of the user that submitted the question. Once a question has been submitted, the rendered question can then be edited, deleted, or answered. If the answer selection is chosen, a user is able to submit an answer to the question that will then be rendered under the corresponding question. Once the question has been answered, the answer option is no longer available. However, if the question is edited and saved, the answer will be reset, so that it can be answered once again. If a user edits a question, but then decides to cancel instead of save, the answer will not be reset. Finally, if a user selects to delete option, both the question and the answer will be erased.

![QuestionAnswerGif](https://media.giphy.com/media/nyUj4mdej98s7CygXb/giphy.gif)

[0]: https://styled-components.com/
