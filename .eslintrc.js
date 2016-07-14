module.exports = {
  "env": {
    "browser": true,
    "commonjs": true,
    "es6": true,
    "node": true
  },
  "plugins": [
    "react"
  ],
  "extends": [ "eslint:recommended", "plugin:react/recommended" ],
  "parserOptions": {
    "ecmaFeatures": {
      "experimentalObjectRestSpread": true,
      "jsx": true
    },
    "sourceType": "module"
  },
  "rules": {
    "indent": [ "error", 2, { "SwitchCase": 1 }],
    "newline-before-return": 1,
    "linebreak-style": [ "error", "unix" ],
    "quotes": [ 1, "single" ],
    "react/display-name": 0,
    "comma-dangle": [ "error", "never" ],
    "semi": [ 1, "always" ],
    "no-return-assign": 2,
    "object-shorthand": 1,
    "curly": [2, "multi-line"],
    "no-unused-vars": 1,
    "comma-spacing": 2,
    "no-debugger": 2,
    "object-curly-spacing": [ 1, "always" ],
    "react/react-in-jsx-scope": 0,
    "react/jsx-uses-vars": 2,
    "react/jsx-closing-bracket-location": 1,
    "react/jsx-pascal-case": [ 2, "always" ],
    "react/sort-prop-types": [ 1 , { "requiredFirst": true } ],
    "react/jsx-sort-props": 1,
    "react/prop-types": 1,
    "react/jsx-no-undef": 1
  },
  "globals": {
    "React": true
  }
};
