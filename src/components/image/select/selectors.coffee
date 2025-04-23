Selectors = 

  "browse file button": "button[name='browse files']"

  "other buttons": "button:not([name='browse files'])"

  "file input": "input[type='file']"

  "search gadgets": "[data-state='browse gadgets'] 
    vellum-autocomplete[name='term']"

  "search unsplash": "[data-state='browse unsplash']
    vellum-autocomplete[name='term']"

  "search unsplash input": "[data-state='browse unsplash']
    vellum-field[name='term']"

  "url input": "vellum-field[type='url']"

export default Selectors