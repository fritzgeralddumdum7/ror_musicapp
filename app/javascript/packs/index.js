import React from 'react'
import { render } from 'react-dom'

const loadElem = () => {
  const elem = document.getElementById('something')

  if (elem !== null) {
    render (
      <h1>
        Hello from React
      </h1>,
      elem
    )
  }
}

document.addEventListener('DOMContentLoaded', () => loadElem())
