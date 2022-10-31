require 'rails_helper'

describe "Destinations API" do
  it "sends a list of destinations" do
    create_list(:destination, 10)

    get '/api/v1/destinations'

    expect(response).to be_successful
    destinations = JSON.parse(response.body, symbolize_names: true)

    expect(destinations[:data].count).to eq 10

    destinations[:data].each do |destination|
      expect(destination).to have_key(:id)
      expect(destination[:id]).to be_a(String)

      expect(destination).to have_key(:type)
      expect(destination[:type]).to be_a(String)

      expect(destination).to have_key(:attributes)
      expect(destination[:attributes].count).to eq 4

      expect(destination[:attributes]).to have_key(:name)
      expect(destination[:attributes][:name]).to be_a(String)

      expect(destination[:attributes]).to have_key(:zip)
      expect(destination[:attributes][:zip]).to be_a(String)

      expect(destination[:attributes]).to have_key(:description)
      expect(destination[:attributes][:description]).to be_a(String)

      expect(destination[:attributes]).to have_key(:image_url)
      expect(destination[:attributes][:image_url]).to be_a(String)
    end
  end

  it 'can get one destination by its id' do
    id = create(:destination).id

    get "/api/v1/destinations/#{id}"

    destination = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(destination[:data]).to have_key(:id)
    expect(destination[:data][:id]).to be_a(String)

    expect(destination[:data]).to have_key(:type)
    expect(destination[:data][:type]).to be_a(String)

    expect(destination[:data]).to have_key(:attributes)
    expect(destination[:data][:attributes].count).to eq 4

    expect(destination[:data][:attributes]).to have_key(:name)
    expect(destination[:data][:attributes][:name]).to be_a(String)

    expect(destination[:data][:attributes]).to have_key(:zip)
    expect(destination[:data][:attributes][:zip]).to be_a(String)

    expect(destination[:data][:attributes]).to have_key(:description)
    expect(destination[:data][:attributes][:description]).to be_a(String)

    expect(destination[:data][:attributes]).to have_key(:image_url)
    expect(destination[:data][:attributes][:image_url]).to be_a(String)
  end

  it 'can create a new destination' do
    dest_params = ({"name": "Denver", "zip": "80208", "description": "Unpredictable Weather","image_url": "https://via.placeholder.com/300x300.png"})
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/destinations', headers: headers, params: JSON.generate(destination: dest_params)
    new_destination = Destination.last

    expect(response).to be_successful
    expect(new_destination.name).to eq(dest_params[:name])
    expect(new_destination.zip).to eq(dest_params[:zip])
    expect(new_destination.description).to eq(dest_params[:description])
    expect(new_destination.image_url).to eq(dest_params[:image_url])
  end

  it 'can update an existing destination' do
    id = create(:destination).id
    old_name = Destination.last.name
    dest_params = { name: "Gotta check this place" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/destinations/#{id}", headers: headers, params: JSON.generate({destination: dest_params})
    destination = Destination.find_by(id: id)

    expect(response).to be_successful
    expect(destination.name).to_not eq(old_name)
    expect(destination.name).to eq("Gotta check this place")
  end

  it 'can destroy a destination' do
    destination = create(:destination)

    expect{ delete "/api/v1/destinations/#{destination.id}"}.to change(Destination, :count).by(-1)
    expect(response).to be_successful
    expect{Destination.find(destination.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end