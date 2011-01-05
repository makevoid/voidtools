module Voidtools
  module AppMixin
    def not_found
      #render template: "exceptions/not_found", status: :not_found
      render file: "/public/404.html", layout: false, status: 404
    end
  end
end