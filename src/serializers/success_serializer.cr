abstract struct SuccessSerializer < BaseSerializer
  @pages : Lucky::Paginator?

  def render : NamedTuple
    json = super

    @pages.try do |pages|
      json = json.merge({pages: {
        current: pages.page,
        items: {
          count: pages.per_page,
          end: pages.item_range.end,
          start: pages.item_range.begin,
          total: pages.item_count,
        },
        next: pages.next_page,
        previous: pages.previous_page,
        series: pages_series(pages),
        total: pages.total,
      }})
    end

    json
  end

  def self.list(list : Array, *args, **named_args)
    list.map { |item| item(item, *args, **named_args) }
  end

  private def status : Status
    Status::Success
  end

  # The idea here is to free the frontend from having to calculate
  # pagination parameters itself. We are therefore sending along the
  # pagination series as built by *Lucky*.

  # Here, a negative number represents the current page, a `0`
  # represents a gap. Eg: `[1,0,5,-6,7,0,11]`.
  private def pages_series(pages)
    pages.series(
      begin: 1,
      end: 1,
      left_of_current: 2,
      right_of_current: 2
    ).map do |item|
      case item
      in Lucky::Paginator::CurrentPage
        -item.number
      in Lucky::Paginator::Page
        item.number
      in Lucky::Paginator::Gap
        0
      end
    end
  end
end
