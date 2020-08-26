# deck

- [Be a better parent to your children - Seattle Meetup - 2020-08-25](./2020-08-25-seattle-meetup/Be%20a%20better%20parent%20to%20your%20children.pdf)

## tools

I use [reveal.js](https://revealjs.com) to create my presentations and use [decktape](https://github.com/astefanutti/decktape) for print my entire presentation to PDF.


### reveal.js

Clone the reveal.js repository

```
$ git clone https://github.com/hakimel/reveal.js.git
```
Move to the reveal.js folder and install dependencies
```
$ cd reveal.js && npm install
```
Serve the presentation and monitor source files for changes
```
$ npm start
```
Open http://localhost:8000 to view your presentation

### decktape

Install decktape
```
$ npm install -g decktape
```
Use decktape
```
$ decktape -s '3840x2160' reveal http://localhost:8000 ~/my_talk.pdf
```
