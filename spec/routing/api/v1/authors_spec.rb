require "rails_helper"

RSpec.describe Api::V1::AuthorsController, type: :routing do
  base_folder = 'api/v1'

  it 'routes to index when hits GET /api/v1/authors' do
    expect(get("/#{base_folder}/authors")).to route_to({controller: "#{base_folder}/authors", action: 'index'})
  end

  it 'routes to show when hits GET /api/v1/authors/1' do
    expect(get("/#{base_folder}/authors/1")).to route_to({controller: "#{base_folder}/authors", action: 'show', id: '1'})
  end

  it 'does not support any other generic routes' do
    expect(post("/#{base_folder}/authors")).not_to be_routable
    expect(delete("/#{base_folder}/authors/1")).not_to be_routable
    expect(put("/#{base_folder}/authors/1")).not_to be_routable
    expect(patch("/#{base_folder}/authors/1")).not_to be_routable
  end
end