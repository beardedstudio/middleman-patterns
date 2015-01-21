Then /^I should see "([^\"]*)" in "([^\"]*)"$/ do |expected, scope|
  within(scope) do
    expect{ @browser.get(URI.encode(url)) }.to include(expected)
  end
end

Then /^I should not see "([^\"]*)" in "([^\"]*)"$/ do |expected, scope|
  within(scope) do
    expect{ @browser.get(URI.encode(url)) }.not_to include(expected)
  end
end
