require "rails_helper"

RSpec.describe Api::V1::BooksController, type: :routing do
  base_folder = 'api/v1'

  it 'routes to index when hits GET /api/v1/books' do
    expect(get("/#{base_folder}/books")).to route_to({controller: "#{base_folder}/books", action: 'index'})
  end

  it 'routes to create when hits POST /api/v1/books' do
    expect(post("/#{base_folder}/books")).to route_to({controller: "#{base_folder}/books", action: 'create'})
  end

  it 'routes to update when hits PUT /api/v1/books/1' do
    expect(put("/#{base_folder}/books/1")).to route_to({controller: "#{base_folder}/books", action: 'update', id: '1'})
  end

  it 'routes to delete when hits DELETE /api/v1/books/1' do
    expect(delete("/#{base_folder}/books/1")).to route_to({controller: "#{base_folder}/books", action: 'destroy', id: '1'})
  end

  it 'routes to show when hits GET /api/v1/books/1' do
    expect(get("/#{base_folder}/books/1")).to route_to({controller: "#{base_folder}/books", action: 'show', id: '1'})
  end
end