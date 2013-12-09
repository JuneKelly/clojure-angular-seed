# spec for homepage

By = protractor.By


describe "Homepage", ->
  ptor = protractor.getInstance()
  #ptor.ignoreSynchronization = true

  beforeEach ->
    ptor.get '/'
    ptor.waitForAngular()

  it 'should have a welcome message', ->
    expect(
      ptor.isElementPresent By.id 'welcome-message'
    ).toEqual true

    message = ptor.findElement By.id 'welcome-message'
    expect(message.getText()).toEqual 'Put something here!'
