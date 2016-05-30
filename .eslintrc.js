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
    "linebreak-style": [ "error", "unix" ],
    "quotes": [ "error", "single" ],
    "comma-dangle": [ "error", "never" ],
    "semi": [ "error", "always" ],
    "object-shorthand": 2,
    "object-curly-spacing": [ "error", "always" ],
    "react/react-in-jsx-scope": 0,
    "react/jsx-uses-vars": 2,
    "react/jsx-pascal-case": [ 2, "always" ],
    "react/sort-prop-types": [ 2 , { "requiredFirst": true } ],
    "react/prop-types": 1,
    "react/jsx-no-undef": 2
  },
  "globals": {
    "React": true
  }
};
