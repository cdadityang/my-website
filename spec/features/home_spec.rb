require 'spec_helper'

describe 'Home Spec', js: true do
  before(:each) do
    visit('/')
  end

  describe "MainHeader" do
    it "Shows Aditya DP Image" do
      expect(page).to have_selector('img[alt="cdadityang DP Header"]')
      expect(page).to have_selector('img[src="./assets/cdadityang-welcome-180x180.png"]')
    end
    
    it "shows My Full Name H1" do
      expect(page).to have_selector('h1', text: 'Aditya Nagla')
    end

    it "shows my usertag p" do
      expect(page).to have_selector('p', text: '@cdadityang')
    end

    it "shows my short description" do
      expect(page).to have_selector('p', text: /I'm into full-stack Web Development. I'm curious about Blockchain, AI and open-source./)
    end
  end

  describe "MainSection" do
    it "shows a little info" do
      expect(page).to have_selector('p', text: /More things will come soon, till then check out some stuff that I did:/)
    end

    context "shows navigation links in form of buttons" do
      it "shows Drabkirn link" do
        expect(page).to have_link('Drabkirn', href: 'https://drabkirn.cdadityang.xyz')
      end
    end
  end

  describe "Social Links" do
    it "shows blog link" do
      expect(page).to have_link('', href: 'https://blog.cdadityang.xyz')
    end

    it "shows github link" do
      expect(page).to have_link('', href: 'https://github.com/cdadityang')
    end

    it "shows twitter link" do
      expect(page).to have_link('', href: 'https://twitter.com/cdadityang')
    end

    it "shows LinkedIn link" do
      expect(page).to have_link('', href: 'https://www.linkedin.com/in/cdadityang')
    end

    it "shows stackoverflow link" do
      expect(page).to have_link('', href: 'https://stackoverflow.com/users/12543970/cdadityang')
    end
  end

  describe "Footer" do
    it "shows copyrights info" do
      expect(page).to have_selector('footer .footer-legal p', text: /Copyrights ©, 2019 - cdadityang/)
    end

    it "Copyrights cdadityang must be clickable to /" do
      expect(page).to have_link('cdadityang', href: '/')
    end

    it "shows Privacy Policy link" do
      expect(page).to have_link('Privacy', href: 'https://drabkirn.cdadityang.xyz/legal/privacy_policy')
    end

    it "shows Terms and Conditions link" do
      expect(page).to have_link('Terms', href: 'https://drabkirn.cdadityang.xyz/legal/terms_conditions')
    end

    it "shows Credits link" do
      expect(page).to have_link('Credits', href: 'https://drabkirn.cdadityang.xyz/legal/credits')
    end

    it "Shows Baaaaaa text" do
      expect(page).to have_selector('footer .footer-baaaaaa p', text: "@Baaaaaa")
    end
  end
end