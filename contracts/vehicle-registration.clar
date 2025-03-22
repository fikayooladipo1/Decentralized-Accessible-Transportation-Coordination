;; Vehicle Registration Contract
;; Records details of accessible transport options

(define-data-var last-id uint u0)

(define-map vehicles
  { id: uint }
  {
    name: (string-ascii 100),
    wheelchair: bool,
    owner: principal
  }
)

;; Register a vehicle
(define-public (register
    (name (string-ascii 100))
    (wheelchair bool)
  )
  (let
    (
      (new-id (+ (var-get last-id) u1))
    )
    (var-set last-id new-id)

    (map-set vehicles
      { id: new-id }
      {
        name: name,
        wheelchair: wheelchair,
        owner: tx-sender
      }
    )

    (ok new-id)
  )
)

;; Get vehicle
(define-read-only (get-vehicle (id uint))
  (map-get? vehicles { id: id })
)
