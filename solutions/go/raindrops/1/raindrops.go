package raindrops

import "strconv"

func Convert(number int) string {
    dropMap := map[int]string{
        3: "Pling",
        5: "Plang",
        7: "Plong",
    }
	var res string

    for k, v := range dropMap {
        if (number % k == 0) { res += v }
    }

    if res == "" {
        return strconv.Itoa(number)
    }

    return res
}
